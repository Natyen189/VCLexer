# VCLexer Assignment

* Cấu trúc chương trình

    - Trong folder `resource`:
        - `Input.txt`: File chứa code ở ngôn ngữ VC.
        - `Output.txt`: File chứa token phân tích được và phân loại.

    - Trong folder `src/main`:
        - `Lexer.java`: File được tạo ra sau khi đã biên dịch file `LexTest.flex`.
        
        - `LexTest.flex`: File chứa các luật để phân tích từ vựng.
        
        - `LexerScanner`: File java chứa hàm `public static void main(String[] args)` phục vụ cho việc đọc file `Input.txt` và ghi token phân tích được ra file `Output.txt`.
        
        - `sym.java`: Là interface chứa giá trị trả về của các từ phân tích được.
        
        - `Token.java`: File chứa class kế thừa class Symbol chứa phương thức để hiển thị loại từ vựng.
    

* Hướng dẫn cách chạy:
  
    - Chạy hàm `public static void main(String[] args)` ở file `LexerScanner.java`.