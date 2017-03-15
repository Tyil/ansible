#! /usr/bin/env sh

#
# Author: Patrick Spek <p.spek@tyil.work>
# License: GPLv3
#

run_playbook()
{
	local playbook=$1
	shift

	ansible-playbook ~ansible/playbooks/"${playbook}".yaml "$@"

	# remove the retry file if this run succeeded
	if [ "$?" = 0 ]
	then
		rm -f ~ansible/playbooks/"${playbook}".retry
	fi
}

main()
{
	# run all available playbooxks if no arguments were given
	if [ "$#" = 0 ]
	then
		for file in ~ansible/playbooks/*.yaml
		do
			# reduce the complete path to just the base filename
			local basename=$(basename "${file}")
			local playbook="${basename%.*}"

			run_playbook "${playbook}"
		done

		exit
	fi

	# run a single given playbook
	run_playbook "$@"
}

main "$@"

