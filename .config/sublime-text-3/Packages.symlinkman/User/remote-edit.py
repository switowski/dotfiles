import sublime_plugin, os
 
# class RemoteEdit(sublime_plugin.EventListener):
#   def on_post_save(self, view):
#     remote = { "/home/switowsk/src/cds-invenio-cern": ["/usr/bin/scp", None, "switowsk@lxplus.cern.ch", "/afs/cern.ch/user/s/switowsk/private/cds-invenio-cern", None],
#                "/home/switowsk/src/invenio": ["/usr/bin/scp", None, "switowsk@lxplus.cern.ch", "/afs/cern.ch/user/s/switowsk/private/invenio", None] }
 
#     for dirname, target in remote.items():
#       if view.file_name().startswith( dirname ):
#         if self.copy_file(view, target, dirname) == 256:
#           path = target[3] + os.path.dirname(target[4])
#           create_target = "ssh %s '[ -d %s  || mkdir -p %s ]'" % (target[2], path, path)
#           if os.system( create_target ) == 0:
#             self.copy_file(view, target, dirname)
 
 
#   def copy_file(self, view, target, dirname):
#     target[1] = view.file_name()
#     target[4] = view.file_name()[len(dirname):]
#     print ("%s %s %s:%s%s" % tuple(target))
#     return os.system( "%s %s %s:%s%s" % tuple(target) )