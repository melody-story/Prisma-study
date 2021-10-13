import { IsBoolean, isBooleanString, isDataURI, IsDate, IsDateString, isDateString, IsNumber, IsOptional, isString, IsString, IsUrl } from "class-validator"

export class ScriptDTO {
    @IsOptional()
    @IsNumber()
    id	
    
    @IsString()
    title	
    
    @IsString()
    url
    
    @IsNumber()
    file_size	  
    
    @IsString()
    remarks     
    
    @IsOptional()
    @IsNumber()
    client_id
    
    @IsDate()// IsDate와 무엇이 다른지...?
    date_of_created
    
    @IsOptional()
    @IsDate()
    date_of_updated
}



export class ScriptStatusDTO {
    @IsOptional()
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

    @IsOptional()
    @IsNumber()
    client_id
        
    @IsDate()
    date_of_created

    @IsOptional()
    @IsDate()
    date_of_updated
}

export class SentenceDTO {
    @IsOptional()
    @IsNumber()
    id	      

    @IsNumber()
    script_id

    @IsString()	    
    context	 

    @IsDate()
    date_of_created	

    @IsOptional()
    @IsDate()
    date_of_updated
}

export class SentenceStatusDTO {
    @IsOptional()
    @IsNumber()
    id	          

    @IsNumber()
    sentance_requirement_id	
    
    @IsBoolean()   
    deadline_status	 
    
    @IsDate()
    date_of_created	
    
    @IsOptional()
    @IsDate()
    date_of_updated
}

export class sentence_requirements {
    @IsOptional()
    @IsNumber()
    id    

    @IsString()
    language

    @IsOptional()
    @IsNumber()
    age	       

    @IsOptional()
    @IsString()
    gender     

    @IsNumber()
    sentance_id	  

    @IsDate()
    date_of_created	
 
    @IsDate()
    date_of_updated
}