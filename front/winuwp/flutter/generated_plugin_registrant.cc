//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <desktop_window/desktop_window_plugin.h>
#include <objectbox_flutter_libs/objectbox_flutter_libs_plugin.h>
#include <open_document/open_document_plugin.h>
#include <url_launcher_windows/url_launcher_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  DesktopWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopWindowPlugin"));
  ObjectboxFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ObjectboxFlutterLibsPlugin"));
  OpenDocumentPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("OpenDocumentPlugin"));
  UrlLauncherPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherPlugin"));
}
