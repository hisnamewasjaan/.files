#!/bin/sh
# Disable annoying terminal keyboard shortcut to open man page.
# Terminal's "Search man Page Index" service (⌘⇧A) conflicts with IntelliJ 'Find action',
# and "Open man Page" (⌘⇧M) is disabled along with it.
#
#   https://gist.github.com/theodson/b4282a3b6e54091db4d52a4c3c10ad25
#
# Run ./disable-manpage-shortcut.sh and you'll be good to go.

# Disabled in both the Services menu and the context menu
DISABLED='<dict>
  <key>enabled_context_menu</key><false/>
  <key>enabled_services_menu</key><false/>
  <key>presentation_modes</key>
  <dict>
    <key>ContextMenu</key><false/>
    <key>ServicesMenu</key><false/>
  </dict>
</dict>'

# Settings are stored in the pbs domain. -dict-add only changes these two entries,
# so other services settings in the domain are kept.
for service in \
  "com.apple.Terminal - Open man Page in Terminal - openManPage" \
  "com.apple.Terminal - Search man Page Index in Terminal - searchManPages"; do
  defaults write pbs NSServicesStatus -dict-add "${service}" "${DISABLED}"
done

# Reload the services, so the shortcuts are freed without logging out
/System/Library/CoreServices/pbs -flush
