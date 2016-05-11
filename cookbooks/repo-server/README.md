# repo-server

This cookbook will provision a new CentOS 7 server to be able to act as a 
local yum repo server.  Furthermore, this repo server will act as part of 
the "patching pipeline" to be used within Chef Delivery to promote a new
set of patches through an approval pipeline.

To do this, the following actions are performed:

1. Apache HTTPd is installed and a directory on the local filesystem is shared.

2. The shared directory will contain four subdirectories:
    * acceptance
    * union
    * rehearsal
    * delivered
    
  Each of these subdirectories will represent the set of available patches that
  can be deployed and verifed at that stage of the pipeline.

3. A `/storage/repos/createallrepos.sh` script is created that can be run to update
    each of the subdirectories yum repo metadata catalogs.
