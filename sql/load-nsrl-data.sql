--
-- load NSRL Data
--
-- 1 May 2019
--
-- all the tables loaded sucessfully (basic numbners of records checked to confirm the correct numer of records were loaded)
-- missing NSRL Version file - not sure why
-- except the big file one.
-- there were many encoding errors
-- destination database is set to UTF-8 the source file is set to ASCII
-- using iconv to convert the encoding:
-- cat NSRLFile.txt | head -n 100000 | iconv --from-code=ASCII --to-code=UTF-8 -c > NSRLFile.short.unicode.omit.txt
-- this too generated errors :(

copy manufacturer(mfgcode, mfgname)
from '/home/abc/share/NSRLMfg.txt' csv header

copy operatingsystem(opsystemcode, opsystemname, opsystemversion, mfgcode)
from '/home/abc/share/NSRLOS.txt' csv header

copy productcode(productcode, productname, productversion, opsystemcode, mfgcode, lang, applicationtype)
from '/home/abc/share/NSRLProd.txt' csv header

-- inital attempt used the sql below and the subsiqent comment to investigate the error.

-- not working due to error as described above 
--copy file(sha1, md5, crc, filename, filesize, productcode, opsystemcode, specialcode)
--from '/home/abc/share/NSRLProd.txt' csv header

--truncate file;
--show client_encoding;

