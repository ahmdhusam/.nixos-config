{ }
# {
#   disko.devices = {
#     disk = {
#       my-disk = {
#         # FIXME: change it the nvme
#         device = "/dev/sdb";
#         type = "disk";
#         content = {
#           type = "gpt";
#           partitions = {
#             ESP = {
#               type = "EF00";
#               size = "1024M";
#               content = {
#                 type = "filesystem";
#                 format = "vfat";
#                 mountpoint = "/boot";
#               };
#             };

#             # swap = {
#             #   size = "8G";
#             #   content = {
#             #     type = "swap";
#             #     resumeDevice = true;
#             #   };
#             # };

#             root = {
#               size = "100%";
#               content = {
#                 type = "filesystem";
#                 format = "ext4";
#                 mountpoint = "/";
#               };
#             };
#           };
#         };
#       };
#     };
#   };
# }
