<?php

/**
 * Combine PNG image strings into
 * one image
 */
class ImageCombine {
    // Resulting image object
    protected $result;
    // Resulting image dimensions
    protected $x = 0;
    protected $y = 0;

    // Base64 encoded PNG strings
    protected $sources = array();

    /**
     * Constructor
     *
     * $sources - Array of Base64 encoded PNG strings
     */
    public function __construct(array $sources) {
        $this->sources = $this->parse($sources);
        $this->setDimensions();
        $this->result = $this->createResult();
    }

    /**
     * Combine PNG image instances into resulting
     * image
     */
    public function combine() {
        foreach($this->sources as $image) {
            // Copy our image onto our $final_img
            imagecopy($this->result, $image, 0, 0, 0, 0, $this->x, $this->y);
        }
    }

    /**
     * Output raw image
     *
     */
    public function raw() {

        // Output image
        imagepng($this->result);
        $image = ob_get_contents(); // Capture the output
        ob_end_clean(); // Clear the output buffer

        return $image;
    }

    /**
     * Output image in stream
     *
     * $fileName - File name to save
     */
    public function output($fileName) {
    	$image = $this->raw();

        header('Content-Type: image/png');
        // header("Content-Disposition: attachment; filename={$fileName}");

        echo $image; // outputs: `http://i.imgur.com/f7UWKA8.png`
    }

    /**
     * Save image to file
     *
     * $filePath - Destination path to save file
     */
    public function save($filePath) {
        // Save image to path
        imagepng($this->result, $filePath);
    }

    /**
     * Parse Base64 encoded PNG strings to GD object instances
     *
     * $strings - Array of Base64 encoded PNG strings
     */
    protected function parse($strings) {
        $sources = array();
        foreach($strings as $string) {
            $string = str_replace('data:image/png;base64,', '', $string);
            $string = str_replace(' ', '+', $string);
            $sources[] = imagecreatefromstring(base64_decode($string));
        }

        return $sources;
    }

    /**
     * Create resulting image instances
     *
     */
    protected function createResult() {
        // dimensions of the final image
        $result = imagecreatetruecolor($this->x, $this->y);

        // Enable blend mode and save full alpha channel
        imagealphablending($result, true);
        imagesavealpha($result, true);

        return $result;
    }

    /**
     * Set X and Y dimensions by largest image
     *
     */
    protected function setDimensions() {
        $xValues = array();
        $yValues = array();

        // Push dimensions to array
        foreach($this->sources as $image) {
            $xValues[] = imagesx($image);
            $yValues[] = imagesy($image);
        }

        // Find smallest values from array
        // and set as resulting image
        // dimensions
        $this->x = min($xValues);
        $this->y = min($yValues);
    }
}