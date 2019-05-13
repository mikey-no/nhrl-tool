-- set up user filesig
-- with permissions on filesig database
-- 4 May 2019

create user rfilesig with password 'password123'; -- not the real password

grant all 
on file, manufacturer, operatingsystem, productcode, rdsversion
to rfilesig;

/*

revoke all 
on file, manufacturer, operatingsystem, productcode, rdsversion
from rfilesig;

drop ROLE rfilesig;

*/