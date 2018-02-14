SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_05\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd "C:\Users\Yimmi Pernillo\Documents\NetBeansProjects\C2P1\[OLC2]Proyecto1_201503470\src\Analizadores"
java -jar "C:\Users\Yimmi Pernillo\Documents\NetBeansProjects\Bibliotecas\java-cup-11a.jar" -parser analisis_sintactico -symbols Simbolos A_Sintactico.cup
pause
