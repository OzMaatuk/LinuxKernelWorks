# !/bin/bash
# directories inside logs should be timestamps,
# need to take the two latest directories.
if [ "$1" == "" ]; then
    echo "$0 " <old name -r>
    exit -1
fi

release=`uname -r`
echo "Start dmesg regression check for $release" > dmesg_checks_results

echo "--------------------------" >> dmesg_checks_results

dmesg -t -l emerg > $release.dmesg_emerg
echo "dmesg emergency regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg_emerg $release.dmesg_emerg >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results

dmesg -t -l crit > $release.dmesg_crit
echo "dmesg critical regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg_crit $release.dmesg_crit >> dmesg_checks_results 
echo "--------------------------" >> dmesg_checks_results

dmesg -t -l alert > $release.dmesg_alert
echo "dmesg alert regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg_alert $release.dmesg_alert >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results

dmesg -t -l err > $release.dmesg_err
echo "dmesg err regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg_err $release.dmesg_err >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results

dmesg -t -l warn > $release.dmesg_warn
echo "dmesg warn regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg_warn $release.dmesg_warn >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results

dmesg -t > $release.dmesg
echo "dmesg regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg $release.dmesg >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results

dmesg -t > $release.dmesg_kern
echo "dmesg_kern regressions" >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results
diff $1.dmesg_kern $release.dmesg_kern >> dmesg_checks_results
echo "--------------------------" >> dmesg_checks_results

echo "--------------------------" >> dmesg_checks_results

echo "End dmesg regression check for $release" >> dmesg_checks_results