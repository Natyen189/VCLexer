# VCLexer Assignment

* Cấu hình
    - Project được chạy bằng IntelliJ.
    - Java SDK: OpenJDK16.0.1.
    - Thư viện: Jlex 1.8.2, Java Cup 11b.
  

* Cấu trúc chương trình

    - Trong folder `resource`:
        - `Input.txt`: File chứa code ở ngôn ngữ VC.
        - `Output.txt`: File chứa token phân tích được và phân loại.
        
    - Trong folder `src/main/cup`:
      
        - `ParserGenerator.cup`: File chứa định nghĩa các ký tự terminal, non-terminal và các luật syntax của ngôn ngữ VC.
        
        - `VCParser.java`: File được sinh ra tự động sau khi biên dịch file `ParserGenerator.cup`.
        
        - `VCParserSym.java`: File được sinh ra tự động, chứa giá trị trả về của các terminal được định nghĩa trong file `ParserGenerator.cup`.
    
    - Trong folder `src/main/jflex`:
   
        - `LexerScanner.java`: File được tạo ra sau khi đã biên dịch file `LexTest.flex`.
        
        - `LexTest.flex`: File chứa các luật để phân tích từ vựng.
      
  - Trong folder `src/main`:   
    
    - `Main.java`: File java chứa hàm `public static void main(String[] args)` phục vụ cho việc đọc file `Input.txt` và ghi token phân tích được ra file `Output.txt`.
    - `Token.java`: File chứa class kế thừa class Symbol chứa phương thức để hiển thị loại từ vựng.
    

* Hướng dẫn cách chạy:
  
    - Chạy hàm `public static void main(String[] args)` ở file `Main.java`.