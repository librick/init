#!/usr/bin/env bash
# See: https://www.debian.org/doc/manuals/securing-debian-manual/restrict-sysrq.en.html
echo "sysrq can be disabled in /etc/sysctl.conf or /etc/sysctl.d/..."
echo "/proc/sys/kernel/sysrq should have value 0"
echo "got value:" $(cat /proc/sys/kernel/sysrq)
