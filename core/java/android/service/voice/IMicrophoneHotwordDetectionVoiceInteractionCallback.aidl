/*
 * Copyright (C) 2021 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.service.voice;

import android.media.AudioFormat;
import android.service.voice.HotwordDetectedResult;
import android.service.voice.HotwordDetectionServiceFailure;
import android.service.voice.HotwordRejectedResult;
import android.service.voice.HotwordTrainingData;

/**
 * Callback for returning the detected result from the HotwordDetectionService.
 *
 * @hide
 */
oneway interface IMicrophoneHotwordDetectionVoiceInteractionCallback {

    /**
     * Called when the detected result is valid.
     */
    void onDetected(
        in HotwordDetectedResult hotwordDetectedResult,
        in AudioFormat audioFormat,
        in ParcelFileDescriptor audioStream);

    /**
     * Called when the detection fails due to an error.
     */
    void onHotwordDetectionServiceFailure(
        in HotwordDetectionServiceFailure hotwordDetectionServiceFailure);

    /**
     * Called when the detected result was not detected.
     */
    void onRejected(
        in HotwordRejectedResult hotwordRejectedResult);

    /**
     * Called by {@link HotwordDetectionService} to egress training data to the
     * {@link HotwordDetector}.
     */
     void onTrainingData(in HotwordTrainingData data);
}
