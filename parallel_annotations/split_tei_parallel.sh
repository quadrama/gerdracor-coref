#!/usr/bin/env sh

cp ./tei/Sara-AH.xml ./tei/Sara-AH_Act1.xml
cp ./tei/Sara-AH.xml ./tei/Sara-AH_Act2.xml
mv ./tei/Sara-AH.xml ./tei/Sara-AH_Act3.xml
cp ./tei/Sara-AS.xml ./tei/Sara-AS_Act1.xml
cp ./tei/Sara-AS.xml ./tei/Sara-AS_Act2.xml
mv ./tei/Sara-AS.xml ./tei/Sara-AS_Act4.xml
cp ./tei/Sara-AK.xml ./tei/Sara-AK_Act1.xml
cp ./tei/Sara-AK.xml ./tei/Sara-AK_Act2.xml
cp ./tei/Sara-AK.xml ./tei/Sara-AK_Act3.xml
cp ./tei/Sara-AK.xml ./tei/Sara-AK_Act4.xml
mv ./tei/Sara-AK.xml ./tei/Sara-AK_Act5.xml
cp ./tei/Sara-JA.xml ./tei/Sara-JA_Act1.xml
cp ./tei/Sara-JA.xml ./tei/Sara-JA_Act2.xml
cp ./tei/Sara-JA.xml ./tei/Sara-JA_Act3.xml
cp ./tei/Sara-JA.xml ./tei/Sara-JA_Act4.xml
mv ./tei/Sara-JA.xml ./tei/Sara-JA_Act5.xml
cp ./tei/Sara-SH.xml ./tei/Sara-SH_Act1.xml
cp ./tei/Sara-SH.xml ./tei/Sara-SH_Act2.xml
cp ./tei/Sara-SH.xml ./tei/Sara-SH_Act3.xml
cp ./tei/Sara-SH.xml ./tei/Sara-SH_Act4.xml
mv ./tei/Sara-SH.xml ./tei/Sara-SH_Act5.xml
cp ./tei/Raeuber-AK.xml ./tei/Raeuber-AK_Act1.xml
cp ./tei/Raeuber-AK.xml ./tei/Raeuber-AK_Act2.xml
cp ./tei/Raeuber-AK.xml ./tei/Raeuber-AK_Act3.xml
cp ./tei/Raeuber-AK.xml ./tei/Raeuber-AK_Act4.xml
mv ./tei/Raeuber-AK.xml ./tei/Raeuber-AK_Act5.xml
cp ./tei/Raeuber-JA.xml ./tei/Raeuber-JA_Act1.xml
cp ./tei/Raeuber-JA.xml ./tei/Raeuber-JA_Act2.xml
cp ./tei/Raeuber-JA.xml ./tei/Raeuber-JA_Act3.xml
cp ./tei/Raeuber-JA.xml ./tei/Raeuber-JA_Act4.xml
mv ./tei/Raeuber-JA.xml ./tei/Raeuber-JA_Act5.xml
cp ./tei/Raeuber-SH.xml ./tei/Raeuber-SH_Act1.xml
cp ./tei/Raeuber-SH.xml ./tei/Raeuber-SH_Act2.xml
cp ./tei/Raeuber-SH.xml ./tei/Raeuber-SH_Act3.xml
cp ./tei/Raeuber-SH.xml ./tei/Raeuber-SH_Act4.xml
mv ./tei/Raeuber-SH.xml ./tei/Raeuber-SH_Act5.xml
mv ./tei/Cato-AF.xml ./tei/Cato-AF_Act2.xml
mv ./tei/Cato-JA.xml ./tei/Cato-JA_Act2.xml
mv ./tei/Cato-SE.xml ./tei/Cato-SE_Act2.xml
mv ./tei/Emilia-IV.xml ./tei/Emilia-IV_Act1.xml
mv ./tei/Emilia-LF.xml ./tei/Emilia-LF_Act1.xml
mv ./tei/Emilia-SE.xml ./tei/Emilia-SE_Act1.xml
python3 ../split_tei.py ./tei ./tei
rm ./tei/*[0-9].xml
