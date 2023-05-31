# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

sckt_path=sctk/bin

if ! [ $1 ]; then
  echo "Usage: bash cal_wer_aishell.sh <path-to-result> <path-to-sctk-bin>"
  exit 1
fi

# if ! [ $2 ]; then
#   echo "Usage: bash cal_wer_aishell.sh <path-to-result> <path-to-sctk-bin>"
#   exit 1
# fi


EXP_HOME=$(cd `dirname $0`; pwd)
export PATH=$EXP_HOME/espnet_wer_calculation:$sckt_path:$PATH
export PYTHONPATH=$EXP_HOME/espnet_wer_calculation:$PYTHONPATH
echo $PATH
dict=demo_data/dummy.txt

#$1
cp $1/data.json $1/data.1.json

cp $1/data.json $1/data.backup

bash $EXP_HOME/espnet_wer_calculation/score_sclite.sh $1 ${dict}  2>&1 | tail -n 3 > $1/wer_short.txt

cat $1/wer_short.txt
cat $1/result.txt | grep Sum | tail -n 1 | sed 's/|/ | /g' | awk '{print $11/$5}' > $1/wer_short_2point.txt
echo -n "Word Error Rate: "
cat $1/wer_short_2point.txt
