import { IsNumber, IsOptional, IsString, IsDate, IsUrl } from 'class-validator';

export class VoiceDTO {
    @IsOptional()
    @IsNumber()
    id	   
    
    @IsNumber()
    file_size	   
    
    @IsUrl()
    @IsString()
    url	          
    
    @IsNumber()
    user_id	        
    
    @IsOptional()
    @IsNumber()
    sentenceRequirementId
   
    @IsDate()
    date_of_created	
    
    @IsOptional()
    @IsDate()
    date_of_updated
}


export class VoiceStatusDTO {
    @IsOptional()
    @IsNumber()
    id      	   
    
    @IsNumber()
    voice_id	    
    
    @IsOptional()
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

    @IsOptional()
    @IsDate()
    date_of_updated
}