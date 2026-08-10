package com.tecno.frontflash;

import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CameraCharacteristics;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;
import android.util.Log;

public class FrontFlashTileService extends TileService {
    private static final String TAG = "FrontFlashTile";
    private CameraManager mCameraManager;
    private String mFrontCameraId = null;
    private boolean mIsFlashOn = false;

    private CameraManager.TorchCallback mTorchCallback = new CameraManager.TorchCallback() {
        @Override
        public void onTorchModeChanged(String cameraId, boolean enabled) {
            if (cameraId.equals(mFrontCameraId)) {
                mIsFlashOn = enabled;
                updateTile();
            }
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
        mCameraManager = (CameraManager) getSystemService(Context.CAMERA_SERVICE);
        
        // Find the front camera with a flash
        try {
            String[] cameraIds = mCameraManager.getCameraIdList();
            for (String id : cameraIds) {
                CameraCharacteristics chars = mCameraManager.getCameraCharacteristics(id);
                Integer facing = chars.get(CameraCharacteristics.LENS_FACING);
                Boolean hasFlash = chars.get(CameraCharacteristics.FLASH_INFO_AVAILABLE);
                
                if (facing != null && facing == CameraCharacteristics.LENS_FACING_FRONT 
                        && hasFlash != null && hasFlash) {
                    mFrontCameraId = id;
                    break;
                }
            }
        } catch (CameraAccessException e) {
            Log.e(TAG, "Error finding front camera", e);
        }
        
        // Fallback to "1" if we couldn't detect it, just in case
        if (mFrontCameraId == null) {
            mFrontCameraId = "1";
        }
    }

    @Override
    public void onStartListening() {
        super.onStartListening();
        if (mCameraManager != null) {
            mCameraManager.registerTorchCallback(mTorchCallback, null);
        }
        updateTile();
    }

    @Override
    public void onStopListening() {
        super.onStopListening();
        if (mCameraManager != null) {
            mCameraManager.unregisterTorchCallback(mTorchCallback);
        }
    }

    @Override
    public void onClick() {
        super.onClick();
        boolean newState = !mIsFlashOn;
        try {
            mCameraManager.setTorchMode(mFrontCameraId, newState);
        } catch (CameraAccessException | IllegalArgumentException e) {
            Log.e(TAG, "Failed to toggle front flash", e);
        }
    }

    private void updateTile() {
        Tile tile = getQsTile();
        if (tile != null) {
            tile.setState(mIsFlashOn ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
            tile.updateTile();
        }
    }
}
