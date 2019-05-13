package app.filesig;

public class CharSetInestigation {

    
    /*
    * From: EngineerWithJava54321 - 
    * https://stackoverflow.com/questions/26268132/all-inclusive-charset-to-avoid-java-nio-charset-malformedinputexception-input
    *
    *
    */
    public void testCharset(String fileName) {
      SortedMap<String, Charset> charsets = Charset.availableCharsets();
      for (String k : charsets.keySet()) {
        int line = 0;
        boolean success = true;
        try (BufferedReader b = Files.newBufferedReader(Paths.get(fileName),charsets.get(k))) {
            while (b.ready()) {
                b.readLine();
                line++;
            }
        } catch (IOException e) {
            success = false;
            System.out.println(k+" failed on line "+line);
        }
        if (success) 
            System.out.println("*************************  Successs "+k);
      }
    }
    
    /**
    * Read CSV File and print out line x 
    * and the lines imediatly before and after it
    * NOTE: This method does not work - it fails for the same
    * malformed input exception with the Charset is set to UTF-8
    * 
    * @param file to read in
    * @param line number of the file to print out in std.err must be greater than 1.
    */
    public void printLineX(String file, long x){
        
        StringBuilder sb = new StringBuilder();
        
        System.err.println("File: " + file);
        
        if (x < 1){
            System.err.println("x: " + x + " is less than 1");
            return;
        }
                
        try{
          Class.forName("app.filesig.FileAction");
          
          BufferedReader br =     Files.newBufferedReader(Paths.get(file),charset); 
            
          // read line by line
          String line;
          long j=0; // line count
          while ((line = br.readLine()) != null) {
            if (j == (x-1))
              sb.append(line).append("\n");
            if (j == x)
              sb.append(line).append("\n");
            if (j == (x+1))
              sb.append(line).append("\n");
            
            j++;
          }    
            
          System.err.println("Line No: " + x);
          System.err.println("Line: " + line);
          
          br.close();
            
        }catch(Exception e){
          System.err.println(
              e.getClass().getName() 
              + ": " + e.getMessage());
        }
        
    }
}