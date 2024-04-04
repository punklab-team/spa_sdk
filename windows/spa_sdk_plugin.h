#ifndef FLUTTER_PLUGIN_SPA_SDK_PLUGIN_H_
#define FLUTTER_PLUGIN_SPA_SDK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace spa_sdk {

class SpaSdkPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SpaSdkPlugin();

  virtual ~SpaSdkPlugin();

  // Disallow copy and assign.
  SpaSdkPlugin(const SpaSdkPlugin&) = delete;
  SpaSdkPlugin& operator=(const SpaSdkPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace spa_sdk

#endif  // FLUTTER_PLUGIN_SPA_SDK_PLUGIN_H_
