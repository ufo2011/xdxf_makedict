generate_file() {
		if [ -z "$1" -o -z "$2" ]; then
				echo "Usage: generate_file nwords file" >&2
				exit 1
		fi
		RANGE=5000
		for ((i=1; i<=$1; i++)); do
				echo $RANDOM | uuencode -m /dev/stdout | grep -v "/dev/stdout" >> $2
		done
}

set_md_plugin_dir() {
	local cur_dir=`pwd`
	cd ../src
	export MAKEDICT_PLUGIN_DIR=`pwd`
	cd "${cur_dir}"
}

create_signle_dummy_dir() {
        mkdir /tmp/test_makedict_plugins
        export MAKEDICT_PLUGIN_DIR=/tmp/test_makedict_plugins
        cp dummy_parser dummy_generator "${MAKEDICT_PLUGIN_DIR}"/
}

delete_single_dummy_dir() {
        rm -fr /tmp/test_makedict_plugins
}