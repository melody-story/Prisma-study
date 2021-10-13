import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { VoiceController } from './voice/voice.controller';
import { VoiceModule } from './voice/voice.module';
import { ScriptController } from './script/script.controller';
import { ScriptModule } from './script/script.module';
import { UserController } from './user/user.controller';

@Module({
  imports: [UserModule, VoiceModule, ScriptModule],
  controllers: [AppController, VoiceController, ScriptController, UserController],
  providers: [AppService],
})
export class AppModule {}
