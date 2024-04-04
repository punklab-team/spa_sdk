#include "include/spa_sdk/spa_sdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "spa_sdk_plugin.h"

void SpaSdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  spa_sdk::SpaSdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
