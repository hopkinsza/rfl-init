FILESDIR = ${ETCBASE}/sysinit/local

FILES = 00-mountcritlocal.sh \
	10-rseed.sh \
	20-hostname.sh \
	30-netstart.sh

# TODO: will become automatic by the build system later
# 10-rseed.sh does not neet to be '*.in', but it makes it easier for now
FILESBUILD = yes

.include <rf/all.mk>
