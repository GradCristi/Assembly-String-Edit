# Assembly-String-Edit
A procedure written in Assembly which transforms the input char string after the following rules:
- all underscores are deleted
- after each underscore the next letter shall be a capital letter
- all other letters shall be lowercase

Examples:
  ''              -> ''             
 'a'             -> 'a'           
 'ab'            -> 'ab'          
 'abc'           -> 'abc'         
 'a_b'           -> 'aB'           
 'A_B'           -> 'aB'           
 'SERVICE_HELP'  -> 'serviceHelp'  
 'JAN_when_OUT'  -> 'janWhenOut'   
 'from_DAY_top'  -> 'fromDayTop'   
 'HOW_BOOK_BUT'  -> 'howBookBut'   
 'now_web_YEAR'  -> 'nowWebYear'   
 'to_camel_case' -> 'toCamelCase'
 'camel_case_123' -> 'camelCase123'
