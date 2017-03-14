#! /usr/bin/env sh

main()
{
	local playbook=$1
	shift

	ansible-playbook ~ansible/playbooks/"${playbook}".yaml "$@"

	if [ "$?" = 0 ]
	then
		rm -f ~ansible/playbooks/"${playbook}".retry
	fi
}

main "$@"

