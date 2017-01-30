import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';

import { LightboxModule } from 'primeng/primeng';// ADDED
import { GalleriaModule } from 'primeng/primeng'; // ADDED


@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    LightboxModule,// ADDED
    GalleriaModule// ADDED
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
