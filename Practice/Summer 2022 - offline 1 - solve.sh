# 1. Navigate to /tmp directory
cd /tmp

# 2. Create a new directory with the name CSI310_X (X=37)
mkdir CSI310_37

# 3. Copy the given `text files` from Downloads folder into the new directory
cp ~/Downloads/File1.txt ~/Downloads/File2.txt ~/Downloads/File3.txt     CSI310_37/

# 4. Create a new empty text file named File4.txt 
touch CSI310_37/File4.txt

# 5. Append contents of File1.txt and File2.txt into File4.txt
cat CSI310_37/File1.txt >> CSI310_37/File4.txt
cat CSI310_37/File2.txt >> CSI310_37/File4.txt

# 6. Sort File3.txt and File4.txt, save into File_37.txt
sort CSI310_37/File3.txt CSI310_37/File4.txt > CSI310_37/File_37.txt

# 7. Print number of words and number of lines in File_37.txt
wc -w CSI310_37/File_37.txt   # word count
wc -l CSI310_37/File_37.txt   # line count

# 8. Print line number 8 to 12 from File_37.txt 
head -n 12 CSI310_37/File_37.txt | tail -n 5

# 9. Create a new user with your student ID (011221437)
sudo useradd 011221437

# 10. Remove read, write permission of File_37.txt for user 011221437
chmod u-rw File_37.txt

# 11. Switch to user 011221437
su - 011221437

# 12. Try to write on File_37.txt (should fail)
echo "test write" >> /tmp/CSI310_37/File_37.txt

# 13. Change back to root user
exit

# 14. (Bonus) Delete the CSI310_37 directory and all its contents
rm -r CSI310_37 
