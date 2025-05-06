#!/bin/bash

my_cpu="$(cat /proc/loadavg| awk '{print $1}')"
my_mem_total="$(free | head -2 | tail -1 | awk '{print $2}')"
my_mem_used="$(free | head -2 | tail -1 | awk '{print $3}')"
my_disk_available="$(df / | tail -n1 | awk '{print $4}')"
my_disk_used="$(df / | tail +2 | awk '{print $3}')"

echo -e "# HELP my_cpu CPU in percent."
echo -e "# TYPE my_cpu gauge"
echo -e "my_cpu $my_cpu"

echo -e "# HELP my_mem_total Total memory."
echo -e "# TYPE my_mem_total gauge"
echo -e "my_mem_total $my_mem_total"

echo -e "# HELP my_mem_used Used memory."
echo -e "# TYPE my_mem_used gauge"
echo -e "my_mem_used $my_mem_used"

echo -e "# HELP my_disk_total Total disk space."
echo -e "# TYPE my_disk_total gauge"
echo -e "my_disk_total $my_disk_available"

echo -e "# HELP my_disk_used Used disk space."
echo -e "# TYPE my_disk_used gauge"
echo -e "my_disk_used $my_disk_used"