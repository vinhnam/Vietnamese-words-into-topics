<?php

/*
 * You need to learn more about cake php in order to run this script. 
 * It's all well documented at http://book.cakephp.org
 * Learn more about cake shell at http://book.cakephp.org/2.0/en/console-and-shells.html
 */

class EscapeGiantXmlCharacterShell extends AppShell {
    
    public function getOptionParser() {
        $parser = parent::getOptionParser();
        $parser->addSubcommand('EscapeXMLCharacters', array(
            'help' => 'just let me know the directory',
        ))->addArgument('month', array(
            'help' => 'Input file',
            'required' => true
        ))->addArgument('year', array(
            'help' => 'Output file',
            'required' => true
        ));
        return $parser;
    }    
    public function main() {
        // input: "/home/nguyenvinhnam/MSEProject/markupStripped_viwiki.xml"
        $handle = fopen($this->args[0], "r") or die("Couldn't get handle");
        if ($handle) {
            while (!feof($handle)) {
                $buffer = fgets($handle, 4096);
                //out "/home/nguyenvinhnam/MSEProject/viwikiText.txt"
                file_put_contents($this->args[0],
                    htmlspecialchars($buffer),FILE_APPEND);
            }
            fclose($handle);
        }
    }
}
