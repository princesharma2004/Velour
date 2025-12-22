from api.v1.endpoints import tests
from fastapi import APIRouter

api_router = APIRouter()

api_router.include_router(
    tests.router,
    prefix="/tests",
    tags=["tests"],
)
