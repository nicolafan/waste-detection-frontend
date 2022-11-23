<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg">
                <h1>Try Waste Detection Model!</h1>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-lg">
                <form>
                    <div>
                        <label for="formImage" class="form-label">Input an image containing waste</label>
                        <input class="form-control form-control-lg" id="formImage" ref="formImage" type="file" accept="image/jpeg, image/png" @change="inputFile">
                    </div>
                    <button type="button" class="btn btn-primary mt-3" @click="submitFile">Submit</button>
                </form>
            </div>
        </div>
        <div v-if="outputImg !== null" class="row mt-3">
            <div class="col-md">
                <h3>Boxes</h3>
                <code>
                {{ jsonBoxes }}
                </code>
            </div>
            <div class="col-md">
                <h3>Image</h3>
                <img v-bind:src="'data:image/jpeg;base64,'+outputImg"/>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios"

export default {
    
    data() {
        return {
            file: null,
            jsonBoxes: null,
            outputImg: null
        }
    },
    methods: {
        inputFile() {
            this.file = this.$refs.formImage.files[0]
            console.log(this.file)
        },
        submitFile() {
            let formData = new FormData();
            formData.append("file", this.file);
            axios.post("/predict", formData, {params: {format: "json"}})
                .then(response => {
                    this.jsonBoxes = response.data;
                })
                .catch(error => {
                    console.log(error.toJSON());
                });
            axios.post("/predict", formData, {params: {format: "img"}})
                .then(response => {
                    this.outputImg = response.data;
                })
                .catch(error => {
                    console.log(error.toJSON());
                });
        }
    }
}
</script>