package app.filesig;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.BufferedReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.HashMap;
import java.util.SortedMap;
import java.util.Iterator;
import java.nio.charset.Charset;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.RegexFileFilter;

public class FileAction {
    
    Charset charset=Charset.forName("ISO_8859_1");
    
    /**
	 * Read a CSV File with the correct format and print its contens to std out.
     * assumes input ISO_8859_1 but should be UTF-8 to be consistent with the NSRL information
	 * 
	 * @param sFile
	 *            File to be parsed
	 */
	public void readCSVFile(String sFile) {
        long lastRec = 0;
        String lastRecord = "<none>";
        HashMap<String,String> lastMap = null;
        CSVParser csvParser = null;
        NSRLFile nsrlfile = new NSRLFile();
        DBAction db = new DBAction();
        
		try {
            
            Class.forName("app.filesig.FileAction");
        
			Reader reader = Files.newBufferedReader(Paths.get(sFile),charset);
			csvParser = new CSVParser(reader,
                //charset,
                CSVFormat
                    .DEFAULT
                    .withFirstRecordAsHeader()
                    .withIgnoreHeaderCase()
                    .withTrim());

			for (CSVRecord csvRecord : csvParser) {
				
                if(csvRecord.isConsistent()){
                // Accessing Values by Column Index
                    nsrlfile.SHA1 = csvRecord.get("SHA-1");
                    nsrlfile.MD5 = csvRecord.get("MD5");
                    nsrlfile.CRC32 = csvRecord.get("CRC32");
                    nsrlfile.FileName = csvRecord.get("FileName");
                    nsrlfile.FileSize = csvRecord.get("FileSize");
                    nsrlfile.ProductCode = csvRecord.get("ProductCode");
                    nsrlfile.OpSystemCode = csvRecord.get("OpSystemCode");
                    nsrlfile.SpecialCode = csvRecord.get("SpecialCode");
                    //if (csvRecord.getRecordNumber() > 30440  &&     csvRecord.getRecordNumber() < 30455 ){
                        System.out.println("Record No - " + csvRecord.getRecordNumber());
                                    
                         System.out.println("---------------");
                         System.out.println("SHA1         : " + csvRecord.get("SHA-1"));
                        System.out.println("MD5          : " + csvRecord.get("MD5"));
//                        System.out.println("CRC32        : " + CRC32);
//                        System.out.println("FileName     : " + FileName);
//                        System.out.println("FileSize     : " + FileSize);
//                        System.out.println("ProductCode  : " + ProductCode);
//                        System.out.println("OpSystemCode : " + OpSystemCode);
//                        System.out.println("SpecialCode  : " + SpecialCode);
                         System.out.println("---------------\n");
                //    }
                    
                }else{
                    System.err.println("---------------\n");
                    System.err.println("csvRecord is Consistent: " + csvRecord.isConsistent() + " \n");
                    System.err.println("---------------\n");
                }
                    
                //get information to help diagnosis of cvs parse problems
                lastRec = csvRecord.getRecordNumber();
                lastRecord = csvRecord.toString();
                
                //insert the NSRL File into the DB
                db.InsertNSRLFile(nsrlfile);

			}

			csvParser.close();

		} catch (IOException ioe) {
			System.err.println("Filedb: IOException: " + ioe.toString() 
            + " lastRec: "  + lastRec);
		} catch (Exception e){
            System.err.println(
                e.getClass().getName() + ": " + e.getMessage() 
            + " lastRec: "  + lastRec);
            System.err.println("HeaderMapSize is wrong: " + csvParser.getHeaderMap().size() + " \n");
            System.err.println("line:::" + lastRecord + "::: \n");
            
        }
   }

	/**
	 * Get a list of files from a given root folder and look in all sub
	 * directories for CSV files matching the following RegEx string
	 * 
	 * <pre>
	 * "NSRLFile.txt.short.txt"
	 * </pre>
	 * 
	 * @param folder
	 *            root folder to search
	 * @return
	 */
	public Collection<File> listFiles(String folder) {
         
		Collection<File> filesCollection = FileUtils.listFiles(new File(folder), new RegexFileFilter("NSRLFile.txt"), // e.g. ".*CSV$"
				DirectoryFileFilter.INSTANCE);

		for (File f : filesCollection) {
			System.out.println("File to process: " + f.getName());
		}

		return filesCollection;
	}
}
