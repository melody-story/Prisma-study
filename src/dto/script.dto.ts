import { Optional, Options } from "@nestjs/common"
import { IsBoolean, isBooleanString, isDataURI, IsDate, IsDateString, isDateString, IsNumber, isString, IsString } from "class-validator"

export class ScriptDTO {
    @Optional()
    @IsNumber()
    id	

    @IsString()
    title	

    @IsNumber()
    file_size	  

    @IsString()
    remarks     
    
    @IsNumber()
    client_id
    
    @IsString()
    url

    @IsDate()// IsDate와 무엇이 다른지...?
    date_of_created

    @IsDate()
    date_of_updated
}

export class ScriptStatusDTO {
    @Optional()
    @IsNumber()
    id	

    @IsNumber()
    script_id	

    @IsBoolean()   
    post	
           
    @IsBoolean()   
    deadline	

    @IsNumber()
    download_count	

    @IsNumber()
    client_id
        
    @IsDate()
    date_of_created

    @IsDate()
    date_of_updated
}

export class SentenceDTO {
    @Optional()
    @IsNumber()
    id	      

    @IsNumber()
    script_id

    @IsString()	    
    context	 

    @IsDate()
    date_of_created	

    @IsDate()
    date_of_updated
}

export class SentenceStatusDTO {
    @IsNumber()
    id	          

    @IsNumber()
    sentance_requirement_id	
    
    @IsBoolean()   
    deadline_status	 
    
    @IsDate()
    date_of_created	
    
    @IsDate()
    date_of_updated
}

export class sentence_requirements {
    @Optional()
    @IsNumber()
    id          	

    @IsString()
    language
    
    @IsNumber()
    age	            

    @IsString()
    gender      	

    @IsNumber()
    sentance_id	  

    @IsNumber()
    voice_id	    
 
    @IsDate()
    date_of_created	
 
    @IsDate()
    date_of_updated
}