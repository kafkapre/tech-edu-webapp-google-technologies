import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  images: any[];

  constructor() {
    this.images = [];
    this.images.push({ source: 'api/img/1', alt:'Description for Image 1', title: 'Image 1' });
    this.images.push({ source: 'api/img/2', alt:'Description for Image 2', title: 'Image 2' });
    this.images.push({ source: 'api/img/3', alt:'Description for Image 3', title: 'Image 3' });
    this.images.push({ source: 'api/img/4', alt:'Description for Image 4', title: 'Image 4' });
  }


}
