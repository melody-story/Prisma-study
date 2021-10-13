import { IsNumber, IsOptional, IsString, IsDate } from "class-validator"

export class VoiceDTO {
    @IsOptional()
    @IsNumber()
    id	   
    
    @IsNumber()
    file_size	   
    
    @IsString()
    description	   
    
    @IsString()
    url	          
    
    @IsNumber()
    user_id	        
    
    @IsDate()
    date_of_created	
    
    @IsDate()
    date_of_updated
}

export class VoiceStatusDTO {
    @IsOptional()
    @IsNumber()
    id      	   
    
    @IsNumber()
    voice_id	    
    
    @IsNumber()
    download_count	
    
    @IsNumber()
    client_id   	
    
    @IsString()
    verify      	
    
    @IsNumber()
    user_id	        
    
    @IsDate()
    date_of_created	
    
    @IsDate()
    date_of_updated
}