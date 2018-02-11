% wave1 = Wave;
% wave2 = Wave;
% 
% wave1.duration = 1;
% wave2.duration = 2;
% 
% strClass = StreamingClass;
% 
% strClass = strClass.addWave(wave1);
% strClass = strClass.addWave(wave2);
% 
% sum([strClass.Waves.duration])
% 
% 
% 
% rawData = readStreamingFile( filename, paths{k} );

streamingObj = StreamingClass();

streamingObj.hdt = 1000e-6;
streamingObj.hlt = 1000e-6;
streamingObj.pdt = 800e-6;

noiseLevel = zeros(1,12);
noiseLevel(12) = 28;

lastIndexArray = ones(1,12);
lastIndexArray = lastIndexArray * ceil(2.5e6*1e-3) * -1;

streamingObj = streamingObj.identifyWaves(rawData, [12], 2.5e6, ...
    noiseLevel, 450, lastIndexArray);

 triggerArray = streamingObj.propertyVector('triggerTime');
