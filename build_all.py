import glob
import re
import subprocess

file_name_list = glob.glob('source/*.*')

for file_name in file_name_list:
    date_str = re.search(r'[0-9]{8}', file_name).group()
    res = subprocess.run(['build.bat', date_str], shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)