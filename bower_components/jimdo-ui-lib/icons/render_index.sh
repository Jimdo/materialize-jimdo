rm index.html



cd common

echo "<h1>Common</h1>" >> ../index.html
for file in *
do
  cat $file >> ../index.html
done

cd ..




cd cms

echo "<h1>CMS</h1>" >> ../index.html
for file in *
do
  cat $file >> ../index.html
done

cd ..