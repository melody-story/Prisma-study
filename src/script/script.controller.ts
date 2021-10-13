import { Controller } from '@nestjs/common';
import { ScriptService } from './script.service';
import { VoiceDTO } from '../dto/voice.dto';

@Controller('script')
export class ScriptController {

    constructor(private readonly scripsService: ScriptService) {}

    // @Get()
    // getAll(): VoiceDTO[] {
    //     return this.scripsService.getAll();
    // }

}
 