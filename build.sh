# Instructions from: https://pcem-emulator.co.uk/phpBB3/viewtopic.php?t=3464
BLUE='\033[34;7m'
NC='\033[0m' # No Color

# Install dependencies
printf "${BLUE}Installing dependencies...${NC}\n"
brew install sdl2 wxmac
# brew install openal-soft # only for old OSX

# Download PCem
printf "${BLUE}Downloading PCem...${NC}\n"
curl https://pcem-emulator.co.uk/files/PCemV17Linux.tar.gz --output PCemV17Linux.tar.gz

# Extract code
printf "${BLUE}Extracting code...${NC}\n"
rm -rf pcem17/
mkdir pcem17
tar -xzf ./PCemV17Linux.tar.gz --directory pcem17/

# Change source files
printf "${BLUE}Changin source files...${NC}\n"
cd pcem17/src

sed -i.old -e '1 i\
#define off64_t off_t' esdi_at.c

sed -i.old -e '1 i\
#define ftello64 ftello \
#define fseeko64 fseeko \
#define fopen64 fopen \
#define off64_t off_t' hdd_file.c

sed -i.old -e '1 i\
#define off64_t off_t' ide.c

sed -i.old -e '1 i\
#define off64_t off_t' mfm_at.c

sed -i.old -e '1 i\
#define off64_t off_t' mfm_xebec.c

sed -i.old -e '1 i\
#define fopen64 fopen \
#define off64_t off_t \
#define ftello64 ftello \
#define fseeko64 fseeko' wx-config.c

sed -i.old -e '/set_window_title/ s|.|//|' pc.c

# Additional changes from: https://pcem-emulator.co.uk/phpBB3/viewtopic.php?f=2&t=3599&p=14805&hilit=mac
sed -i.old -e '1 i\
#include <sys/time.h>' wx-thread.c

sed -i.old -e '1 i\
#include <unistd.h>' slirp/slirp.h

# Build
cd ../
printf "${BLUE}Configuring...${NC}\n"
./configure --enable-networking --enable-release-build

printf "${BLUE}Making...${NC}\n"
make
