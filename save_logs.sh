timestamp=$(date +%s)
mkdir ~/linux_mainline/logs/$(timestamp)
dmesg -t > ~/linux_mainline/logs/$(timestamp)/dmesg_current
dmesg -t -k > ~/linux_mainline/logs/$(timestamp)/dmesg_kernel
dmesg -t -l emerg > ~/linux_mainline/logs/$(timestamp)/dmesg_current_emerg
dmesg -t -l alert > ~/linux_mainline/logs/$(timestamp)/dmesg_current_alert
dmesg -t -l crit > ~/linux_mainline/logs/$(timestamp)/dmesg_current_crit
dmesg -t -l err > ~/linux_mainline/logs/$(timestamp)/dmesg_current_err
dmesg -t -l warn > ~/linux_mainline/logs/$(timestamp)/dmesg_current_warn
wc -l ~/linux_mainline/logs/$(timestamp)/