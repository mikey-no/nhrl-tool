package app.filesig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBAction {
    
    private String fixFileName(filename){
        
        if (filename.contains("'")){
            String newfilename;
            newfilename = filename.replaceAll("'", "''");
            return newfilename;
        }
        
        return filename;
    }

    public void InsertNSRLFile(NSRLFile nsrlf){
      Connection c = null;
      Statement stmt = null;
        String sql = null;
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager           .getConnection("jdbc:postgresql://localhost:5432/filesig",
            "postgres", "<not the password>");
         c.setAutoCommit(false);
            
          //assume this opens ok!
          //System.out.println("Opened database successfully");
                
                   
         sql = "INSERT INTO file(sha1, md5, crc32, filename, filesize, productcode,opsystemcode, specialcode)  VALUES (" 
             + "'" + nsrlf.SHA1 + "',"
             + "'" + nsrlf.MD5 + "',"
             + "'" + nsrlf.CRC32 + "',"
             + "'" + fixFileName(nsrlf.FileName) + "'," 
             + "'" + nsrlf.FileSize + "',"
             + "'" + nsrlf.ProductCode + "',"
             + "'" + nsrlf.OpSystemCode + "',"
             + "'" + nsrlf.SpecialCode + "'"
             + ");";
          
         System.out.println("sql: " + sql);
          
         stmt = c.createStatement();
         stmt.executeUpdate(sql);
         
         stmt.close();
         c.commit();
         c.close();
      } catch (Exception e) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
      }
      System.out.println("Records created successfully");
        return;
   }
}

