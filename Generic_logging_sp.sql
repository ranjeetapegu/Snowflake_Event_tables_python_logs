/****
generic function : to log the messages 
args: message string and level string 

how to run 
select log_trace_data('this is test message','INFO');

 */

CREATE OR REPLACE FUNCTION log_trace_data(message string,level string )
RETURNS VARCHAR
LANGUAGE PYTHON
RUNTIME_VERSION = 3.9
HANDLER = 'log_message'
AS $$
import logging

def log_message(message, level):
    logging.basicConfig(
        level=logging.DEBUG,  # Set the lowest level to capture all messages
        format="%(asctime)s - %(levelname)s - %(message)s"
    )
    if level == "DEBUG":
        logging.debug(message)
    elif level == "INFO":
        logging.info(message)
    elif level == "WARNING":
        logging.warning(message)
    elif level == "ERROR":
        logging.error(message)
    elif level == "CRITICAL":
        logging.critical(message)
    else:
        raise ValueError(f"Invalid log level: {level}. Use one of DEBUG, INFO, WARNING, ERROR, CRITICAL.")

    return "success!!"
   
 
$$;