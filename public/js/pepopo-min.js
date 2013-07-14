!function(){var a=function(a,b){return function(){return a.apply(b,arguments)}},b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};$(function(){var b,d,e;return d=function(b){function d(){return this.schedule=a(this.schedule,this),e=d.__super__.constructor.apply(this,arguments)}return c(d,b),d.prototype.initialize=function(){return this.context=new webkitAudioContext,this.masterGain=this.context.createGain(),this.masterGain.connect(this.context.destination),this.masterGain.gain.value=.4,this.nextNoteTime=0,this.currentNote=0,this.noteLength=.25,this.tempo=60,this.noteMax=16,this.timer=null},d.prototype.el=$("#pepopo-machine"),d.prototype.events={"click #play-pepopo-machine":"play","click #stop-pepopo-machine":"stop"},d.prototype.play=function(){return this.timer?void 0:(this.nextNoteTime=this.context.currentTime,this.currentNote=0,this.schedule())},d.prototype.stop=function(){return clearInterval(this.timer),this.timer=null},d.prototype.schedule=function(){for(var a,b,c,d;this.nextNoteTime<this.context.currentTime+.2;){switch(b=this.context.createGain(),b.gain.setTargetAtTime(0,this.nextNoteTime,this.noteLength),b.connect(this.masterGain),c=this.context.createOscillator(),c.connect(b),this.currentNote){case 0:a=880;break;case 4:case 8:case 12:a=440;break;default:a=220}c.frequency.value=a,c.start(this.nextNoteTime),c.stop(this.nextNoteTime+this.noteLength),d=60/this.tempo,this.nextNoteTime+=.25*d,this.currentNote++,this.currentNote>=this.noteMax&&(this.currentNote=0)}return this.timer=setTimeout(this.schedule,0)},d}(Backbone.View),b=new d})}.call(this);
/*
//@ sourceMappingURL=public/js/pepopo-min.js.map
*/