import requests
from bs4 import BeautifulSoup
import time

downloadList = []
url0 = "https://ftp.cngb.org/pub/"

sampleID = []
for i in range(468, 968):
    sampleID.append("CNS0178" + str(i))

for sample in sampleID:
    time.sleep(1)
    url1 = url0 + sample + "/"
    response = requests.get(url1)
    soup = BeautifulSoup(response.text, "html.parser")
    a = soup.select('tr > td')
    b = [i.getText() for i in a]
    dataID =[]
    for i in list(range(0,len(b),3)):
        dataID.append(b[i])
    dataID1 = [i for i in dataID if i.startswith("CNA")]
    for data in dataID1:
        url2 = url1 + data
        response = requests.get(url2)
        soup = BeautifulSoup(response.text, "html.parser")
        fas = [i.getText() for i in soup.select('tr > td .text-primary')]
        for fa in fas:
            downloadList.append(url2 + fa)

with open("download.list", "w") as fo:
    for i in downloadList:
        fo.write(i + "\n")