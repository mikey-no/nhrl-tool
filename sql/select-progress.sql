SELECT count(fileid), now() --, sha1, md5, crc32, filename, filesize, productcode, opsystemcode, specialcode
	FROM public.file;
    
    SELECT * FROM public.file
ORDER BY fileid ASC LIMIT 100

/*

Error message - 12 May 2019

abc@abc-VirtualBox:~/share/filesig$ ./filesig-run.bash 1> /dev/null
org.postgresql.util.PSQLException: Unterminated string literal started at position 252 in SQL INSERT INTO file(sha1, md5, crc32, filename, filesize, productcode,opsystemcode, specialcode)  VALUES ('0ED90D890EBB82A299C07979A5A6DF7D3D2299C4','C93F58D9B0841D401DA5F0440D0AB6F4','EFB7CB5E','pt_BR_kid's room_pal_s_prv_sm.png','13245','15685','362','D');. Expected  char

--
-- possibly caused by the file name having a ' - single quote, this will need to be escaped!
-- 

filename: 'womble's of woodrow'
would become: 'womble''s of woodrow'

-- ref: http://www.postgresqltutorial.com/postgresql-insert/

*/