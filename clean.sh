set -e 
cd `dirname $0`
make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} distclean
