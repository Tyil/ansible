#! /usr/bin/env sh

main()
{
	local playbook=$1
	shift

	ansible-playbook ~ansible/playbooks/"${playbook}".yaml "$@"
}

main "$@"

