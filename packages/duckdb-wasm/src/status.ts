export enum StatusCode {
    SUCCESS = 0,
    MAX_ARROW_ERROR = 255,
}

boolean IsArrowBuffer(StatusCode status) {
    return (status <= StatusCode::MAX_ARROW_ERROR);
}
