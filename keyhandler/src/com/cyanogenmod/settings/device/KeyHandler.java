/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.bluetooth.BluetoothAdapter;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.wifi.WifiManager;
import android.provider.Settings;
import android.util.Slog;
import android.view.KeyEvent;

import com.android.internal.os.DeviceKeyHandler;

public final class KeyHandler implements DeviceKeyHandler {

    private static final String TAG = KeyHandler.class.getSimpleName();

    // Supported scancodes
    private static final int KEY_RFKILL = 247;
    private static final int KEY_START_SETTINGS = 250;

    private static final int[] ALL_HANDLED_SCANCODES = {
        KEY_RFKILL,
        KEY_START_SETTINGS
    };

    private final Context mContext;
    private final Intent mSettingsIntent;
    private WifiManager mWifiManager;
    private BluetoothAdapter mBluetoothAdapter;

    public KeyHandler(Context context) {
        mContext = context;

        mSettingsIntent = new Intent(Intent.ACTION_MAIN, null);
        mSettingsIntent.setAction(Settings.ACTION_SETTINGS);
        mSettingsIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
    }

    @Override
    public boolean handleKeyEvent(KeyEvent event) {
        boolean consumed = false;

        // Are we able to handle it?
        int index = isHandled(event);
        if (index == -1) {
            // Then don't consume the key
            return false;
        }

        // Now check every type of scancode that we are able to handle
        switch (event.getScanCode()) {
            case KEY_RFKILL:
                toggleWifi();
                toggleBluetooth();
                consumed = true;
                break;
            case KEY_START_SETTINGS:
                launchSettings();
                consumed = true;
                break;
        }
        // Return if the key was consumed here
        return consumed;
    }

    private int isHandled(final KeyEvent event) {
        int scancode = event.getScanCode();
        int cc = ALL_HANDLED_SCANCODES.length;
        for (int i = 0; i < cc; i++) {
            if (ALL_HANDLED_SCANCODES[i] == scancode){
                return i;
            }
        }
        return -1;
    }

    private void toggleWifi() {
        if (mWifiManager == null) {
            mWifiManager = (WifiManager) mContext.getSystemService(Context.WIFI_SERVICE);
        }

        int state = mWifiManager.getWifiState();
        int apState = mWifiManager.getWifiApState();

        if (state == WifiManager.WIFI_STATE_ENABLING
                || state == WifiManager.WIFI_STATE_DISABLING) {
            return;
        }
        if (apState == WifiManager.WIFI_AP_STATE_ENABLING
                || apState == WifiManager.WIFI_AP_STATE_DISABLING) {
            return;
        }

        if (state == WifiManager.WIFI_STATE_ENABLED
                || apState == WifiManager.WIFI_AP_STATE_ENABLED) {
            mWifiManager.setWifiEnabled(false);
            mWifiManager.setWifiApEnabled(null, false);

        } else if (state == WifiManager.WIFI_STATE_DISABLED
                && apState == WifiManager.WIFI_AP_STATE_DISABLED) {
            mWifiManager.setWifiEnabled(true);
        }
    }

    private void toggleBluetooth() {
        if (mBluetoothAdapter == null) {
            mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        }

        int state = mBluetoothAdapter.getState();

        if (state == BluetoothAdapter.STATE_TURNING_OFF
                || state == BluetoothAdapter.STATE_TURNING_ON) {
            return;
        }
        if (state == BluetoothAdapter.STATE_OFF) {
            mBluetoothAdapter.enable();
        }
        if (state == BluetoothAdapter.STATE_ON) {
            mBluetoothAdapter.disable();
        }
    }

    private void launchSettings() {
        try {
            mContext.startActivity(mSettingsIntent);
        } catch (ActivityNotFoundException ex) {
            Slog.e(TAG, "Could not launch settings intent", ex);
        }
    }
}
