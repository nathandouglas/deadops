#!/usr/bin/env bash


########################################################################
# Author: Nathan Douglas
# Version: 0.1
# Script Overview...
#
# Boiler plate template for creating consistent bash scripts.
#
#
#
#
# Args:
# --filename     (String) The name of your script
# --directory    (String) Where to save the script. (Optional)
########################################################################

set -o errexit
set -o pipefail
set -o nounset

# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app


POSITIONAL=()


while [[ $# -gt 0 ]]
do
key="$1"

case $key in

    --filename)
    FILENAME="$2"
    shift # past argument
    shift # past value
    ;;

    --directory)
    DIRECTORY="$2"
    shift # past argument
    shift # past value
    ;;

    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done

DIRECTORY=${DIRECTORY:-__dir}

BOILERPLATE="
#!/usr/bin/env bash\n
\n
\n
########################################################################\n
# Author: Nathan Douglas
# Version: 0.1
#
# Script Overview: \n
#\n
########################################################################\n
\n
\n
set -o errexit\n
set -o pipefail\n
set -o nounset\n
\n
"
echo $TOP
