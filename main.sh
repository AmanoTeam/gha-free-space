#!/bin/bash

declare -ra packages=(
	'*apache2*'
	'*docker*'
	'*dotnet*'
	'*firefox*'
	'*google*'
	'*gstreamer*'
	'*jdk*'
	'*nginx*'
	'*php*'
	'*ruby*'
	'*wayland*'
	'ant'
	'auto*'
	'azure-cli'
	'bind9*'
	'binutils*'
	'build-essential'
	'buildah'
	'clang*'
	'container*'
	'fonts*'
	'gcc-11'
	'gcc-12'
	'gh'
	'glib*'
	'kubectl'
	'libllvm*'
	'libmono*'
	'lld*'
	'llvm*'
	'mercurial*'
	'microsoft-edge-stable'
	'mysql*'
	'postgresql*'
	'snapd'
	'vim*'
	'x11*'
	'xdg*'
)

sudo apt purge \
	--allow-remove-essential \
	--auto-remove \
	"${packages[@]}"

mv '/opt/runner-cache' '/home/runner'

for directory in '/home/runner/actions-runner/cached/'*; do
	unlink "${directory}/externals"
	
	ln \
		--symbolic \
		--relative \
		--force \
		'/home/runner/runner-cache/externals' \
		"${directory}"
done

sudo rm \
	--recursive \
	--force \
	"${HOME}/.cargo" \
	"${HOME}/.rustup" \
	"${HOME}/linuxbrew" \
	'/home/linuxbrew' \
	'/home/packer' \
	'/etc/cni/net.d' \
	'/etc/docker' \
	'/etc/mono' \
	'/etc/mysql' \
	'/lib/tmpfiles.d' \
	'/opt/'* \
	'/opt/az' \
	'/usr/lib/heroku' \
	'/usr/lib/mono' \
	'/usr/lib/llvm-'* \
	'/usr/libexec/docker' \
	'/usr/local/lib/android' \
	'/usr/local/share/man' \
	'/usr/local/share/vcpkg' \
	'/usr/share/fonts' \
	'/usr/share/icons' \
	'/usr/share/java' \
	'/usr/share/php' \
	'/usr/share/swift' \
	'/var/lib/apache2' \
	'/var/lib/gems' \
	'/var/lib/snapd' \
	'/snap' \
	'/var/log' \
	'/usr/local/.ghcup' \
	'/usr/local/aws-sam-cli' \
	'/usr/local/aws-cli' \
	'/usr/local/share/chrom'* \
	'/usr/local/share/powershell' \
	'/usr/share/az_'* \
	'/usr/share/doc' \
	'/usr/share/miniconda'
